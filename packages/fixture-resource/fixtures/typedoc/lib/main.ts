/**
 * (c) Copyright Ascensio System SIA 2024
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @license
 */

/**
 * @packageDocumentation
 *
 * This module serves as the main entry point for interacting with various
 * animal and vehicle instances. It demonstrates the usage of classes from both
 * the `animals.ts` and `cars.ts` modules by providing an `Application` class
 * that manages collections of animals and vehicles.
 *
 * ## Overview
 *
 * The `main.ts` module is designed to integrate the functionalities of the
 * `animals.ts` and `cars.ts` modules in a cohesive manner. It provides a
 * centralized `Application` class that allows for the addition and management
 * of animal and vehicle instances.
 *
 * ## Usage
 *
 * The `main.ts` module can be used to create an instance of the `Application`
 * class and interact with its methods to manage animals and vehicles. Below is
 * an example of how to create and use an instance of the `Application` class.
 *
 * ```typescript
 * import {Application} from "./main.ts"
 * import {Bird, Fish, Mammal} from "./animals.ts"
 * import {Car, Motorcycle, Truck} from "./cars.ts"
 *
 * const app = new Application()
 *
 * // Add animals
 * const eagle = new Bird("Eagle", "Aquila", 5, "mountain", 2.3)
 * const salmon = new Fish("Salmon", "Salmo", 3, "ocean", "freshwater")
 * const lion = new Mammal("Lion", "Panthera leo", 8, "savannah", true)
 * app.addAnimal(eagle)
 * app.addAnimal(salmon)
 * app.addAnimal(lion)
 *
 * // Add vehicles
 * const sedan = new Car("Toyota", "Camry", 2021, "gasoline", true)
 * const bike = new Motorcycle("Harley-Davidson", "Sportster", 2019, "gasoline", false)
 * const truck = new Truck("Ford", "F-150", 2020, "diesel", 5)
 * app.addVehicle(sedan)
 * app.addVehicle(bike)
 * app.addVehicle(truck)
 * ```
 *
 * @module Application
 */

import {type Animal} from "./animals.ts"
import {type Vehicle} from "./cars.ts"

export * from "./animals.ts"
export * from "./cars.ts"

/**
 * The Application class serves as the main entry point for interacting with
 * various animal and vehicle instances. It demonstrates the usage of classes
 * from both the animals and cars modules.
 *
 * @categoryDescription Animal Operations
 *
 * Animal operations include adding and removing animal instances from the
 * application. The Application class provides methods for managing collections
 * of animals.
 *
 * @categoryDescription Vehicle Operations
 *
 * Vehicle operations include adding and removing vehicle instances from the
 * application. The Application class provides methods for managing collections
 * of vehicles.
 */
export class Application {
  #animals: Animal[]
  #vehicles: Vehicle[]

  constructor() {
    this.#animals = []
    this.#vehicles = []
  }

  /**
   * Adds an animal to the application.
   * @category Animal Operations
   * @param animal The animal instance to add.
   */
  addAnimal(animal: Animal): void {
    this.#animals.push(animal)
  }

  /**
   * Adds a vehicle to the application.
   * @category Vehicle Operations
   * @param vehicle The vehicle instance to add.
   */
  addVehicle(vehicle: Vehicle): void {
    this.#vehicles.push(vehicle)
  }

  /**
   * Removes an animal from the application.
   * @category Animal Operations
   * @param animal The animal instance to remove.
   */
  removeAnimal(animal: Animal): void {
    for (const [i, a] of this.#animals.entries()) {
      if (a === animal) {
        this.#animals.splice(i, 1)
        return
      }
    }
  }

  /**
   * Removes a vehicle from the application.
   * @category Vehicle Operations
   * @param vehicle The vehicle instance to remove.
   */
  removeVehicle(vehicle: Vehicle): void {
    for (const [i, v] of this.#vehicles.entries()) {
      if (v === vehicle) {
        this.#vehicles.splice(i, 1)
        return
      }
    }
  }
}
