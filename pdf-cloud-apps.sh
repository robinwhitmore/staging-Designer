# Note that .sh scripts work only on Mac. If you're on Windows, install Git Bash and use that as your client.

echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

echo "Building PDF-friendly HTML site for Cloud APIs ...";
bundle exec jekyll serve --detach --config _config_Cloud.yml,pdfconfigs/config_cloud_apps_pdf.yml;
echo "done";

echo "Building the PDF ...";
prince --javascript --input-list=x_cloud_output/pdf/pdfconfigs/prince-list.txt -o x_cloud_output/pdf/CloudApps.pdf;
echo "done";

