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
 * This module provides a comprehensive representation of various animal types
 * and their characteristics. It includes an abstract base class `Animal` that
 * defines common properties and methods shared among all animals, as well as
 * specific implementations for different types of animals such as birds, fish,
 * and mammals.
 *
 * ## Overview
 *
 * The `animals.ts` module is designed to model the natural world of animals in
 * a structured and extensible manner. It leverages TypeScript's class
 * inheritance to create a hierarchy of animal types, each with its own unique
 * properties and behaviors.
 *
 * ## Usage
 *
 * The `animals.ts` module can be used to create instances of different animal
 * types and interact with their properties and methods. Below is an example of
 * how to create and use instances of the `Bird`, `Fish`, and `Mammal` classes.
 *
 * ```typescript
 * import {Bird, Fish, Mammal, type Habitat, type WaterType} from "./animals.ts"
 *
 * // Create a bird instance
 * const eagle = new Bird("Eagle", "Aquila", 5, "mountain", 2.3)
 * console.log(eagle.sound()) // Output: Eagle chirps or sings.
 * console.log(eagle.move())  // Output: Eagle flies through the sky.
 *
 * // Create a fish instance
 * const salmon = new Fish("Salmon", "Salmo", 3, "ocean", "freshwater")
 * console.log(salmon.sound()) // Output: Salmon remains mostly silent underwater.
 * console.log(salmon.move())  // Output: Salmon swims gracefully.
 *
 * // Create a mammal instance
 * const lion = new Mammal("Lion", "Panthera leo", 8, "savannah", true)
 * console.log(lion.sound()) // Output: Lion makes a typical mammal sound.
 * console.log(lion.move())  // Output: Lion walks or runs.
 * ```
 *
 * @categoryDescription Implementations
 *
 * This category includes the concrete implementations of animal classes such
 * as `Bird`, `Fish`, and `Mammal`. These classes extend the abstract `Animal`
 * base class and provide specific properties and methods for each animal type.
 *
 * @module Animals
 */

/**
 * Represents the natural habitat types where animals may reside.
 */
export type Habitat = "forest" | "savannah" | "ocean" | "mountain" | "desert"

/**
 * Abstract base class for all animals.
 * Provides common properties and methods shared among all animals.
 */
export class Animal {
  /**
   * The given name of the animal.
   */
  name: string

  /**
   * The species classification of the animal.
   */
  species: string

  /**
   * The age of the animal in years.
   */
  age: number

  /**
   * The natural habitat of the animal.
   */
  habitat: Habitat

  /**
   * @param name The given name of the animal.
   * @param species The species classification of the animal.
   * @param age The age of the animal in years.
   * @param habitat The natural habitat of the animal.
   */
  constructor(
    name: string,
    species: string,
    age: number,
    habitat: Habitat,
  ) {
    this.name = name
    this.species = species
    this.age = age
    this.habitat = habitat
  }

  /**
   * Abstract method to define the sound made by the animal.
   * @returns A string describing the sound.
   */
  sound(): string {
    throw new Error("The method 'sound' must be implemented by a subclass.")
  }

  /**
   * Abstract method to describe how the animal moves.
   * @returns A string describing the movement.
   */
  move(): string {
    throw new Error("The method 'move' must be implemented by a subclass.")
  }

  /**
   * Provides information about the animal.
   * @returns A string containing details about the animal.
   */
  info(): string {
    return `The ${this.species} named ${this.name} is ${this.age} years old and lives in the ${this.habitat}.`
  }
}

/**
 * Class representing birds. Inherits from the Animal base class and includes
 * additional properties for birds.
 *
 * @category Implementations
 */
export class Bird extends Animal {
  /**
   * The wingspan of the bird in meters.
   */
  wingSpan: number

  /**
   * @param name The name of the bird.
   * @param species The species classification of the bird.
   * @param age The age of the bird in years.
   * @param habitat The natural habitat of the bird.
   * @param wingSpan The wingspan of the bird in meters.
   */
  constructor(
    name: string,
    species: string,
    age: number,
    habitat: Habitat,
    wingSpan: number,
  ) {
    super(name, species, age, habitat)
    this.wingSpan = wingSpan
  }

  /**
   * Defines the sound typically made by the bird.
   * @returns A string describing the sound.
   */
  sound(): string {
    return `${this.name} chirps or sings.`
  }

  /**
   * Describes the movement of the bird.
   * @returns A string describing the movement.
   */
  move(): string {
    return `${this.name} flies through the sky.`
  }
}

/**
 * The type of water the fish lives in.
 */
export type WaterType = "freshwater" | "saltwater"

/**
 * Class representing fish. Inherits from the Animal base class and includes
 * additional properties for fish.
 *
 * @category Implementations
 */
export class Fish extends Animal {
  /**
   * The type of water the fish lives in.
   */
  waterType: WaterType

  /**
   * @param name The name of the fish.
   * @param species The species classification of the fish.
   * @param age The age of the fish in years.
   * @param habitat The natural habitat of the fish.
   * @param waterType The type of water the fish lives in.
   */
  constructor(
    name: string,
    species: string,
    age: number,
    habitat: Habitat,
    waterType: WaterType,
  ) {
    super(name, species, age, habitat)
    this.waterType = waterType
  }

  /**
   * Defines the sound typically made by the fish.
   * @returns A string describing the sound.
   */
  sound(): string {
    return `${this.name} remains mostly silent underwater.`
  }

  /**
   * Describes the movement of the fish.
   * @returns A string describing the movement.
   */
  move(): string {
    return `${this.name} swims gracefully.`
  }
}

/**
 * Class representing mammals. Inherits from the Animal base class and includes
 * additional properties for mammals.
 *
 * @category Implementations
 */
export class Mammal extends Animal {
  /**
   * Indicates if the mammal is primarily active at night.
   */
  isNocturnal: boolean

  /**
   * @param name The name of the mammal.
   * @param species The species classification of the mammal.
   * @param age The age of the mammal in years.
   * @param habitat The natural habitat of the mammal.
   * @param isNocturnal Indicates if the mammal is primarily active at night.
   */
  constructor(
    name: string,
    species: string,
    age: number,
    habitat: Habitat,
    isNocturnal: boolean,
  ) {
    super(name, species, age, habitat)
    this.isNocturnal = isNocturnal
  }

  /**
   * Defines the sound typically made by the mammal.
   * @returns A string describing the sound.
   */
  sound(): string {
    return `${this.name} makes a typical mammal sound.`
  }

  /**
   * Describes the movement of the mammal.
   * @returns A string describing the movement.
   */
  move(): string {
    return `${this.name} walks or runs.`
  }
}
