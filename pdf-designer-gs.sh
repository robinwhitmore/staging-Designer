# Note that .sh scripts work only on Mac. If you're on Windows, install Git Bash and use that as your client.

echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

echo "Building PDF-friendly HTML site for Designer Migration ...";
bundle exec jekyll serve --detach --config _config_Designer.yml,pdfconfigs/config_designer_gs_pdf.yml;
echo "done";

echo "Building the PDF ...";
prince --javascript --input-list=x_designer_output/pdf/pdfconfigs/prince-list.txt -o downloads/Migration.pdf;
echo "done";

