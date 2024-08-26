---
order: -1
---

## Introduction

To integrate **ONLYOFFICE Document Builder** into your own application on **Ruby** you need to download and install **ONLYOFFICE Document Builder** to your computer and use the [Ruby example](../Overview/index.md) for the integration. We will show how to run the Ruby example on Linux OS.

## Step 1. Download and install ONLYOFFICE Document Builder

First, download **ONLYOFFICE Document Builder** and install it to your computer:

[Get ONLYOFFICE Document Builder](https://www.onlyoffice.com/download-builder.aspx?from=api)

## Step 2. Install the prerequisites and run the application

1. Install **Ruby Version Manager (RVM)** and the latest stable **Ruby** version:

   ``` sh
   gpg --keyserver "hkp://keys.gnupg.net" --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
   \curl -sSL https://get.rvm.io | bash -s stable --rails
   ```

   > You will need to have **curl** installed on your system to continue. In case you do not have it, run the command for installation:
   > 
   > ``` sh
   > sudo apt-get install curl
   > ```

2. Create the *Ruby Example* project folder. Download the archive with the Ruby Example and unpack the archive in the created folder:

   ``` sh
   wget "https://github.com/ONLYOFFICE/document-builder-integration/releases/latest/download/Ruby.Example.zip"
   unzip Ruby.Example.zip
   ```

3. Change the current directory for the project directory:

   ``` sh
   cd ~/Ruby\ Example/
   ```

4. Install the dependencies:

   ``` sh
   bundle install
   ```

   > You might need to install **bundler** before you will be able to complete this operation. This is done using the command:
   > 
   > ``` sh
   > gem install bundler
   > ```

5. Automate **Ruby** launch at the computer startup:

   ``` sh
   echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
   ```

6. And run the **Rails** application:

   ``` sh
   rails s -b 0.0.0.0 -p 80
   ```

Now you will be able to see the result in your browser using the `http://localhost` address or using the computer address in your local network.

If you want to experiment with the code changes, you can find the main application code in the *\~/app/controllers/main\_page\_controller.rb* control.
