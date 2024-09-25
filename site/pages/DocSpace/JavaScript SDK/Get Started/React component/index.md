---
order: -1
---

The ONLYOFFICE DocSpace React [component](https://github.com/ONLYOFFICE/docspace-react) integrates ONLYOFFICE DocSpace into [React](https://react.dev/) projects.

> To work with this component, you need to have ONLYOFFICE DocSpace. If you are new to DocSpace, [create an account](https://www.onlyoffice.com/docspace-registration.aspx?from=api).

## Prerequisites

This procedure requires [Node.js (and npm)](https://nodejs.org/en).

## Creating the demo React application with ONLYOFFICE DocSpace

This procedure creates a [basic React application](https://github.com/facebook/create-react-app) and installs an ONLYOFFICE DocSpace in it.

1. Create a new React project named *docspace-react-demo* using the *Create React App* package:

   ``` sh
   npx create-react-app docspace-react-demo
   ```

2. Go to the newly created directory:

   ``` sh
   cd docspace-react-demo
   ```

3. Install ONLYOFFICE DocSpace React component from **npm** and save it to the *package.json* file with *--save*:

   ``` sh
   npm install --save @onlyoffice/docspace-react
   ```

4. Open the *./src/App.js* file in the *docspace-react-demo* project and replace its contents with the following code:

   ``` tsx
   import {DocSpace} from "@onlyoffice/docspace-react"
   import React, {useRef} from "react"

   function onAppReady(e) {
     console.log("ONLYOFFICE DocSpace App is ready!")
   }

   function onAppError(e) {
     console.log(e)
   }

   function onLoadComponentError(errorCode, errorDescription) {
     console.log(errorDescription)
   }

   export default function App() {
     return (
       <pre>
         <DocSpace
           url="http://example-onlyoffice.com/"
           config={{
             frameId: "onlyoffice-docspace",
             mode: "manager",
             width: "100%",
             height: "100%",
             events: {
               onAppReady: "onAppReady",
               onAppError: "onAppError",
             },
           }}
           onLoadComponentError={onLoadComponentError}
         />
       </pre>
     )
   }
   ```

   Replace the following line with your own data:

   - `http://example-onlyoffice.com/` - replace with the URL of your server.

   This JavaScript file will create the *App* component containing the ONLYOFFICE DocSpace configured with basic features.

5. Test the application using the Node.js development server:

   - To start the development server, navigate to the *docspace-react-demo* directory and run:

     ``` sh
     npm run start
     ```

   - To stop the development server, select on the command line or command prompt and press *Ctrl+C*.

## Deploying the demo React application

The easiest way to deploy the application to a production environment is to install [serve](https://github.com/vercel/serve) and create a static server:

1. Install the *serve* package globally:

   ``` sh
   npm install -g serve
   ```

2. Serve your static site on the 3000 port:

   ``` sh
   serve -s build
   ```

   Another port can be adjusted using the *-l* or *--listen* flags:

   ``` sh
   serve -s build -l 4000
   ```

3. To serve the project folder, go to it and run the *serve* command:

   ``` sh
   cd docspace-react-demo
   serve
   ```

Now you can deploy the application to the created server:

1. Navigate to the *docspace-react-demo* directory and run:

   ``` sh
   npm run build
   ```

   The *build* directory will be created with a production build of your app.

2. Copy the contents of the *docspace-react-demo/build* directory to the root directory of the web server (to the *docspace-react-demo* folder).

The application will be deployed on the web server (`http://localhost:3000` by default).

## ONLYOFFICE DocSpace React component API

### Properties

| Name                  | Type                                                  | Default | Description                                                                                                 |
| --------------------- | ----------------------------------------------------- | ------- | ----------------------------------------------------------------------------------------------------------- |
| url\*                 | string                                                | null    | Address of ONLYOFFICE DocSpace.                                                                             |
| config\*              | object                                                | null    | Generic [configuration object](../../JavaScript%20SDK/Config/index.md) for opening a file with a token.     |
| email                 | string                                                | null    | The user email to login in DocSpace.                                                                        |
| onRequestPasswordHash | (email: string) => string                             | null    | The function called when the email parameter is passed, returning the *passwordHash* for login in DocSpace. |
| onUnsuccessLogin      | () => void                                            | null    | The function called when DocSpace account login failed.                                                     |
| onLoadComponentError  | (errorCode: number, errorDescription: string) => void | null    | The function called when an error occurs while loading a component.                                         |

\* *- required field*

## Installing Storybook

Install [Storybook](https://storybook.js.org/) to develop UI components in isolation:

1. Change the address of the DocSpace in the *.env* file:

   ``` ini
   "DOCSPACE_URL": "https://example-onlyoffice.com/"
   ```

   where `http://example-onlyoffice.com/` is the URL to the server with **ONLYOFFICE DocSpace** installed.

2. Build Storybook with the following command:

   ``` sh
   npm run build-storybook
   ```

3. Start Storybook:

   ``` sh
   npm run storybook
   ```

## Developing ONLYOFFICE DocSpace React component

1. Clone project from the GitHub repository:

   ``` sh
   git clone https://github.com/ONLYOFFICE/docspace-react
   ```

2. Install the project dependencies:

   ``` sh
   npm install
   ```

3. Test the component:

   ``` sh
   npm run test
   ```

4. Build the project:

   ``` sh
   npm run rollup
   ```

5. Create the package:

   ``` sh
   npm pack
   ```

## Feedback and support

In case you have any issues, questions, or suggestions for the ONLYOFFICE DocSpace React component, please refer to the [Issues](https://github.com/ONLYOFFICE/docspace-react/issues) section.
