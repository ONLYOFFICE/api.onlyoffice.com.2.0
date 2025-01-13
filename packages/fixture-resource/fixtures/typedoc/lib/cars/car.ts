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
 * Class representing cars. Inherits from the Vehicle base class and includes
 * additional properties for cars.
 *
 * @category Implementations
 */
export class Car extends Vehicle {
  /**
   * Indicates if the car is a sedan.
   */
  isSedan: boolean

  /**
   * @param brand The manufacturer of the car.
   * @param model The specific model of the car.
   * @param year The year the car was manufactured.
   * @param fuelType The type of fuel the car uses.
   * @param isSedan Indicates if the car is a sedan.
   */
  constructor(
    brand: string,
    model: string,
    year: number,
    fuelType: FuelType,
    isSedan: boolean,
  ) {
    super(brand, model, year, fuelType)
    this.isSedan = isSedan
  }

  /**
   * Defines the sound typically made by the car.
   * @returns A string describing the sound.
   */
  sound(): string {
    return `${this.brand} ${this.model} goes vroom!`
  }

  /**
   * Describes the movement of the car.
   * @returns A string describing the movement.
   */
  move(): string {
    return `${this.brand} ${this.model} drives on the road.`
  }
}
