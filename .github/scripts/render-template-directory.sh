#!/bin/bash
set -ex

echo "Rendering template directory index..."

# Create temporary directory for template directory
echo "Creating temporary directory for template directory..."
temp_dir="temp_gallery"
mkdir -p "$temp_dir"

# Copy necessary files
echo "Copying files..."
cp brand_templates_quarto.yml "${temp_dir}/_quarto.yml"
cp index.qmd "${temp_dir}/"

# Print quarto configuration
echo "Quarto configuration:"
cat "${temp_dir}/_quarto.yml"

# Render in temp directory
echo "Starting render process..."
cd "$temp_dir"
timeout 300 quarto render || {
    echo "Template directory render failed or timed out!"
    echo "Current directory contents:"
    ls -la
    echo "Current working directory:"
    pwd
    cd ..
    exit 1
}
cd ..

# Move output to main _site directory
echo "Moving rendered output..."
cp -r "${temp_dir}/_site"/* "_site/"

# Cleanup
echo "Cleaning up..."
rm -rf "$temp_dir"

echo "Template directory index rendered successfully"