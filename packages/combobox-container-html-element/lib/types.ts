import {
  type ComboboxContainerChangeEvent,
  type ComboboxContainerChangeEventListener,
  type ComboboxContainerChangedEvent,
  type ComboboxContainerChangedEventListener,
  type GlobalComboboxContainerChangeEventHandler,
  type GlobalComboboxContainerChangedEventHandler,
} from "./events.ts"

export type ComboboxContainerAttribute =
  ComboboxContainerAttributeMap[ComboboxContainerAttributeName]

export type ComboboxContainerAttributeName =
  keyof ComboboxContainerAttributeMap

export type ComboboxContainerAttributeMap = {
  [K in ComboboxContainerPropertyName]: string
} & {
  [K in ComboboxContainerEventListenerName]: string
}

export type ComboboxContainerProperty =
  ComboboxContainerPropertyMap[ComboboxContainerPropertyName]

export type ComboboxContainerPropertyName =
  keyof ComboboxContainerPropertyMap

export interface ComboboxContainerPropertyMap {
  "default-index": string
  "disabled": string
  "name": string
  "page-size": string
}

export type ComboboxContainerFallbackState =
  ComboboxContainerFallbackStateMap[ComboboxContainerFallbackStateName]

export type ComboboxContainerFallbackStateName =
  keyof ComboboxContainerFallbackStateMap

export type ComboboxContainerFallbackStateMap = {
  [K in keyof ComboboxContainerStateMap as `state-${string & K}`]: ComboboxContainerStateMap[K]
}

export type ComboboxContainerState =
  ComboboxContainerStateMap[ComboboxContainerStateName]

export type ComboboxContainerStateName =
  keyof ComboboxContainerStateMap

export interface ComboboxContainerStateMap {
  selected: boolean
}

export type ComboboxContainerEventListener =
  ComboboxContainerEventListenerMap[ComboboxContainerEventListenerName]

export type ComboboxContainerEventListenerName =
  keyof ComboboxContainerEventListenerMap

export interface ComboboxContainerEventListenerMap {
  [ComboboxContainerChangeEvent.handlerName]: ComboboxContainerChangeEventListener
  [ComboboxContainerChangedEvent.handlerName]: ComboboxContainerChangedEventListener
}

export type GlobalComboboxContainerEventHandler =
  GlobalComboboxContainerEventHandlerMap[GlobalComboboxContainerEventHandlerName]

export type GlobalComboboxContainerEventHandlerName =
  keyof GlobalComboboxContainerEventHandlerMap

export interface GlobalComboboxContainerEventHandlerMap {
  [ComboboxContainerChangeEvent.handlerName]: GlobalComboboxContainerChangeEventHandler
  [ComboboxContainerChangedEvent.handlerName]: GlobalComboboxContainerChangedEventHandler
}
