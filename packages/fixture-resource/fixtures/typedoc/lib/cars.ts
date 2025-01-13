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
 * This module provides a comprehensive representation of various vehicle types
 * and their characteristics. It includes an abstract base class `Vehicle` that
 * defines common properties and methods shared among all vehicles, as well as
 * specific implementations for different types of vehicles such as cars,
 * motorcycles, and trucks.
 *
 * ## Overview
 *
 * The `cars.ts` module is designed to model the world of vehicles in a
 * structured and extensible manner. It leverages TypeScript's class
 * inheritance to create a hierarchy of vehicle types, each with its own unique
 * properties and behaviors.
 *
 * ## Usage
 *
 * The `cars.ts` module can be used to create instances of different vehicle
 * types and interact with their properties and methods. Below is an example of
 * how to create and use instances of the `Car`, `Motorcycle`, and `Truck`
 * classes.
 *
 * ```typescript
 * import {Car, Motorcycle, Truck, type FuelType} from "./cars.ts"
 *
 * // Create a car instance
 * const sedan = new Car("Toyota", "Camry", 2021, "gasoline", true)
 * console.log(sedan.sound()) // Output: Toyota Camry goes vroom!
 * console.log(sedan.move())  // Output: Toyota Camry drives on the road.
 *
 * // Create a motorcycle instance
 * const bike = new Motorcycle("Harley-Davidson", "Sportster", 2019, "gasoline", false)
 * console.log(bike.sound()) // Output: Harley-Davidson Sportster goes braap!
 * console.log(bike.move())  // Output: Harley-Davidson Sportster speeds down the road.
 *
 * // Create a truck instance
 * const truck = new Truck("Ford", "F-150", 2020, "diesel", 5)
 * console.log(truck.sound()) // Output: Ford F-150 goes honk honk!
 * console.log(truck.move())  // Output: Ford F-150 hauls goods on the highway.
 * ```
 *
 * @categoryDescription Implementations
 *
 * This category includes the concrete implementations of vehicle classes such
 * as `Car`, `Motorcycle`, and `Truck`, each with its own unique properties and
 * methods. These classes extend the abstract `Vehicle` base class and provide
 * specific details for each vehicle type.
 *
 * @module Cars
 */

export * from "./cars/car.ts"
export * from "./cars/motorcycle.ts"
export * from "./cars/truck.ts"
export * from "./cars/vehicle.ts"
