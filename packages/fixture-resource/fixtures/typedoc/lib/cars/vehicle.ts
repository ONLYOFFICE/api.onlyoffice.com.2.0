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
 * Represents the type of fuel used by a vehicle.
 */
export type FuelType = "gasoline" | "diesel" | "electric" | "hybrid"

/**
 * Abstract base class for all vehicles. Provides common properties and methods
 * shared among all vehicles.
 */
export class Vehicle {
  /**
   * The manufacturer of the vehicle.
   */
  brand: string

  /**
   * The specific model of the vehicle.
   */
  model: string

  /**
   * The year the vehicle was manufactured.
   */
  year: number

  /**
   * The type of fuel the vehicle uses.
   */
  fuelType: FuelType

  /**
   * @param brand The manufacturer of the vehicle.
   * @param model The specific model of the vehicle.
   * @param year The year the vehicle was manufactured.
   * @param fuelType The type of fuel the vehicle uses.
   */
  constructor(
    brand: string,
    model: string,
    year: number,
    fuelType: FuelType,
  ) {
    this.brand = brand
    this.model = model
    this.year = year
    this.fuelType = fuelType
  }

  /**
   * Abstract method to define the sound made by the vehicle.
   * @returns A string describing the sound.
   */
  sound(): string {
    throw new Error("The method 'sound' must be implemented by a subclass.")
  }

  /**
   * Abstract method to describe how the vehicle moves.
   * @returns A string describing the movement.
   */
  move(): string {
    throw new Error("The method 'move' must be implemented by a subclass.")
  }

  /**
   * Provides information about the vehicle.
   * @returns A string containing details about the vehicle.
   */
  info(): string {
    return `The ${this.year} ${this.brand} ${this.model} runs on ${this.fuelType}.`
  }
}
