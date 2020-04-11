rmdir /s /q templates
mkdir templates

docfx template export default
docfx template export pdf.default

move _exported_templates/default templates/template-html
move _exported_templates/pdf.default templates/template-pdf
