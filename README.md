# DocFX_UnityExample
An example setup of using DocFX to generate online and offline documentation for a Unity asset or project

## Initial setup
Download DocFX from https://dotnet.github.io/docfx/index.html and extract it somewhere you can refer to it later.

If you want to also create PDF documentation you will also need to download and extract the WK HTML to PDF tool available here: https://wkhtmltopdf.org/downloads.html

Add the commands to your Windows system path:
- Open explorer
- Right click on **This PC** and select **Properties**
- Go to **Advanced System Settings** and under the **Advanced** tab, click the **Environment Variables** button
- Edit the **Path** variable and add a new line that points to the folder you extracted the DocFX zip to
- If generating PDFs, also add a new line which points to the folder you extracted wkhtmltopdf to

## Exporting Templates
You can run the **create_templates.bat** batch file to export the site and PDF templates from DocFX and move them to the **templates** folder. You can modify these files to change the look and feel of the generated documentation.

## Writing Custom Docs
Manual documentation is added to the **manual** folder. The example **\*.md** files show how to link between pages and how to add images to the documentation. The example **toc.yml** shows how to create a hierarchy of pages.

The documentaton pages are formatted using a system called markdown (as with GitHub docs). For information on the formatting features of markdown, the following site has a lot of useful information: https://daringfireball.net/projects/markdown/syntax

PDF documentation requires a separate front page and separate table of contents. You can find these in the **pdf** folder. The **pdf-intro.md** file acts as a replacement front page for the PDF docs instead of the standard **index.md**. The **toc.yml** file lists the pages to include. This is essentially a copy of the contents of the manual **toc.yml**, but with the PDF intro added at the start, and with the file paths updated to point to the correct folder (**../manual/**).

## API Docs
DocFX can parse and generate documentation from triple-slash (\\\) XML comments in C# code.

The **src** folder is set up with a **Assembly-CSharp.csproj** file which includes all C# files contained in the **code** and **stubs** folders. The simplest way to work with this is to copy all \*.cs files from your Unity project into the **code** folder. Sub-folder structure does not matter, so a simple way to do this is to use Windows search with the  **\*.cs** search term and copy all the files from the search results.

For information on the different XML comment features available, see the following links:
- https://dotnet.github.io/docfx/spec/triple_slash_comments_spec.html
- https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/xmldoc/

The front page of the API reference must be placed in the **api** folder. It is very easy to get this folder out of sync, so the clean and build batch files copy this in once the source intermediates have been built by copying the **index_api.swap** file over to the folder and renaming it to **index.md**. To change the contents of the front page, you should edit the **index_api.swap** file.

## Json Settings
The **global.json** file specifies some information required for the whole site. This includes the message in the site footer, and whether to enable the search functionality.

The **docfx.json** is used to build the HTML site, while the **docfx-with-pdf.json** is used to build both the HTML and PDF docs. You can change the output folders and filenames in these files.

## Building And Viewing
The following \*.bat files can be found in the root folder:
- **build.bat** performs an incremental build of the online documentation and then serves the site until return is pressed in the command prompt.
- **build-with-pdf.bat** performs an incremental build and serves the site as above, but also incrementally builds the PDF docs
- **clean-and-build.bat** clears existing generated site data and rebuilds the site, serving it once completed
- **clean-and-build-with-pdf.bat** clears existing generated site and PDF data, then rebuilds and serves

The clean and build batch files also clear the generated API documentation. They then copy the template front-page for the API docs from **index_api.swap** to **api/index.md**. Make sure to make any changes to the swap file instead of the file in the api folder.

When building the documentation using the \*.bat files as above or by using the **docfx** command with the **--serve** argument then the built site will be hosted by docfx until interrupted. You can access the site by opening your browser and going to http://localhost:8080/. Some files will be cached by your browser, so to ensure that you are looking at the latest version of the site, you should access it using your browser's incognito or private browsing mode.

## Remaining Tasks
There are 3 main issues that need resolving in this current setup:
1. Classes outside the parsed scripts will not be correctly referenced in the inheritance hierarchy. For example, a class that inherits from **UnityEngine.MonoBehaviour** will show as inheriting from **System.Object** instead. I have tried solving this using the **xrefmap.yml** solution, and also using stub classes in the **src/stubs** folder, but neither solution has been satisfactory.
2. You can't easily include multiple API and documentation versions. The ideal would be a version dropdown in the navigation bar, or a dropdown each for the **Manual** and **Scripting Reference** navigation menu options.
3. You currently need to copy and modify the contents of the main TOC to the PDF TOC. This seems like it should be fairly easy to automate


