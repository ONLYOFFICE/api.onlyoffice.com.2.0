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

import {type FuelType, Vehicle} from "./vehicle.ts"

/**
 * Class representing trucks. Inherits from the Vehicle base class and includes
 * additional properties for trucks.
 *
 * @category Implementations
 */
export class Truck extends Vehicle {
  /**
   * The cargo capacity of the truck in tons.
   */
  capacity: number

  /**
   * @param brand The manufacturer of the truck.
   * @param model The specific model of the truck.
   * @param year The year the truck was manufactured.
   * @param fuelType The type of fuel the truck uses.
   * @param capacity The cargo capacity of the truck in tons.
   */
  constructor(
    brand: string,
    model: string,
    year: number,
    fuelType: FuelType,
    capacity: number,
  ) {
    super(brand, model, year, fuelType)
    this.capacity = capacity
  }

  /**
   * Defines the sound typically made by the truck.
   * @returns A string describing the sound.
   */
  sound(): string {
    return `${this.brand} ${this.model} goes honk honk!`
  }

  /**
   * Describes the movement of the truck.
   * @returns A string describing the movement.
   */
  move(): string {
    return `${this.brand} ${this.model} hauls goods on the highway.`
  }
}
