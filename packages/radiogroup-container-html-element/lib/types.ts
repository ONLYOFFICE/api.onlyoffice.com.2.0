import {
  type GlobalRadiogroupContainerChangeEventHandler,
  type GlobalRadiogroupContainerChangedEventHandler,
  type RadiogroupContainerChangeEvent,
  type RadiogroupContainerChangeEventListener,
  type RadiogroupContainerChangedEvent,
  type RadiogroupContainerChangedEventListener,
} from "./events.ts"

export type RadiogroupContainerAttribute =
  RadiogroupContainerAttributeMap[RadiogroupContainerAttributeName]

export type RadiogroupContainerAttributeName =
  keyof RadiogroupContainerAttributeMap

export type RadiogroupContainerAttributeMap = {
  [K in RadiogroupContainerPropertyName]: string
} & {
  [K in RadiogroupContainerEventListenerName]: string
}

export type RadiogroupContainerProperty =
  RadiogroupContainerPropertyMap[RadiogroupContainerPropertyName]

export type RadiogroupContainerPropertyName =
  keyof RadiogroupContainerPropertyMap

export interface RadiogroupContainerPropertyMap {
  "default-index": string
  "default-value": string
  "disabled": string
  "name": string
}

export type RadiogroupContainerEventListener =
  RadiogroupContainerEventListenerMap[RadiogroupContainerEventListenerName]

export type RadiogroupContainerEventListenerName =
  keyof RadiogroupContainerEventListenerMap

export interface RadiogroupContainerEventListenerMap {
  [RadiogroupContainerChangeEvent.handlerName]: RadiogroupContainerChangeEventListener
  [RadiogroupContainerChangedEvent.handlerName]: RadiogroupContainerChangedEventListener
}

export type GlobalRadiogroupContainerEventHandler =
  GlobalRadiogroupContainerEventHandlerMap[GlobalRadiogroupContainerEventHandlerName]

export type GlobalRadiogroupContainerEventHandlerName =
  keyof GlobalRadiogroupContainerEventHandlerMap

export interface GlobalRadiogroupContainerEventHandlerMap {
  [RadiogroupContainerChangeEvent.handlerName]: GlobalRadiogroupContainerChangeEventHandler
  [RadiogroupContainerChangedEvent.handlerName]: GlobalRadiogroupContainerChangedEventHandler
}
