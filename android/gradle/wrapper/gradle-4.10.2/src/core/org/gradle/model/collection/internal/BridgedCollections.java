/*
 * Copyright 2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.gradle.model.collection.internal;

import org.gradle.api.Action;
import org.gradle.api.NamedDomainObjectCollection;
import org.gradle.api.Namer;
import org.gradle.api.Transformer;
import org.gradle.api.internal.DefaultNamedDomainObjectCollection;
import org.gradle.internal.Factory;
import org.gradle.model.internal.core.ModelActionRole;
import org.gradle.model.internal.core.ModelPath;
import org.gradle.model.internal.core.ModelReference;
import org.gradle.model.internal.core.ModelRegistration;
import org.gradle.model.internal.core.ModelRegistrations;
import org.gradle.model.internal.core.MutableModelNode;
import org.gradle.model.internal.core.rule.describe.SimpleModelRuleDescriptor;
import org.gradle.model.internal.type.ModelType;

public abstract class BridgedCollections {

    private BridgedCollections() {
    }

    public static <I, C extends DefaultNamedDomainObjectCollection<I>> ModelRegistrations.Builder registration(
        final ModelReference<C> containerReference,
        final Transformer<? extends C, ? super MutableModelNode> containerFactory,
        final Namer<? super I> namer,
        String descriptor,
        final Transformer<String, String> itemDescriptorGenerator
    ) {
        final ModelPath containerPath = containerReference.getPath();
        final ModelType<C> containerType = containerReference.getType();
        assert containerPath != null : "container reference path cannot be null";

        return ModelRegistrations.of(containerPath)
            .action(ModelActionRole.Create, new Action<MutableModelNode>() {
                public void execute(final MutableModelNode containerNode) {
                    final C container = containerFactory.transform(containerNode);
                    containerNode.setPrivateData(containerType, container);
                }
            })
            .action(ModelActionRole.Create, new Action<MutableModelNode>() {
                @Override
                public void execute(final MutableModelNode containerNode) {
                    C container = containerNode.getPrivateData(containerType);
                    container.whenElementKnown(new Action<DefaultNamedDomainObjectCollection.ElementInfo<I>>() {
                        @Override
                        public void execute(DefaultNamedDomainObjectCollection.ElementInfo<I> info) {
                            final String name = info.getName();
                            if (!containerNode.isMutable()) {
                                // Ignore tasks created after not closed
                                return;
                            }
                            if (!containerNode.hasLink(name)) {
                                ModelRegistration itemRegistration = ModelRegistrations
                                    .unmanagedInstanceOf(
                                        ModelReference.of(containerPath.child(name), (Class)info.getType()),
                                        new ExtractFromParentContainer<I, C>(name, containerType)
                                    )
                                    .descriptor(new SimpleModelRuleDescriptor(new Factory<String>() {
                                        @Override
                                        public String create() {
                                            return itemDescriptorGenerator.transform(name);
                                        }
                                    }))
                                    .build();
                                containerNode.addLink(itemRegistration);
                            }
                        }
                    });
                    container.whenObjectRemoved(new Action<I>() {
                        public void execute(I item) {
                            String name = namer.determineName(item);
                            containerNode.removeLink(name);
                        }
                    });
                }
            })
            .descriptor(descriptor);
    }

    private static class ExtractFromParentContainer<I, C extends NamedDomainObjectCollection<I>> implements Transformer<I, MutableModelNode> {

        private final String name;
        private final ModelType<C> containerType;

        public ExtractFromParentContainer(String name, ModelType<C> containerType) {
            this.name = name;
            this.containerType = containerType;
        }

        @Override
        public I transform(MutableModelNode modelNode) {
            return modelNode.getParent().getPrivateData(containerType).getByName(name);
        }
    }

}

