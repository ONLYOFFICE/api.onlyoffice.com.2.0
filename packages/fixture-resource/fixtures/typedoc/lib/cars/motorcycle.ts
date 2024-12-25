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
 * Class representing motorcycles. Inherits from the Vehicle base class and
 * includes additional properties for motorcycles.
 *
 * @category Implementations
 */
export class Motorcycle extends Vehicle {
  /**
   * Indicates if the motorcycle has a sidecar.
   */
  hasSidecar: boolean

  /**
   * @param brand The manufacturer of the motorcycle.
   * @param model The specific model of the motorcycle.
   * @param year The year the motorcycle was manufactured.
   * @param fuelType The type of fuel the motorcycle uses.
   * @param hasSidecar Indicates if the motorcycle has a sidecar.
   */
  constructor(
    brand: string,
    model: string,
    year: number,
    fuelType: FuelType,
    hasSidecar: boolean,
  ) {
    super(brand, model, year, fuelType)
    this.hasSidecar = hasSidecar
  }

  /**
   * Defines the sound typically made by the motorcycle.
   * @returns A string describing the sound.
   */
  sound(): string {
    return `${this.brand} ${this.model} goes braap!`
  }

  /**
   * Describes the movement of the motorcycle.
   * @returns A string describing the movement.
   */
  move(): string {
    return `${this.brand} ${this.model} speeds down the road.`
  }
}
