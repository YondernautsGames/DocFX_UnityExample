rmdir /s /q "_site"
rmdir /s /q "_site-pdf"
rmdir /s /q "api"
rmdir /s /q "src/obj"
rmdir /s /q "obj"
mkdir api
copy /y "index_api.swap" "api/index.md"
docfx docfx-with-pdf.json