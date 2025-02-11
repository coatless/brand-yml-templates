#!/bin/bash
set -ex

# Accept brand directory as argument
brand_dir=$1
brand_name=$(basename "$brand_dir")

echo "Processing brand: $brand_name"
echo "From directory: $brand_dir"

# Create temporary directory
temp_dir="temp_${brand_name}"
echo "Creating temp directory: $temp_dir"
mkdir -p "$temp_dir"

# Copy files
echo "Copying files to temp directory..."
cp _quarto.yml "${temp_dir}/"
cp demo-index.qmd "${temp_dir}/index.qmd"
cp -r "${brand_dir}" "${temp_dir}/"

# Update brand path
echo "Updating brand path in _quarto.yml..."
yq -i '.brand = "'"${brand_name}/_brand.yml"'"' "${temp_dir}/_quarto.yml"

# Debug: Show contents of temp directory
echo "Temp directory contents:"
ls -la "${temp_dir}"
echo "Brand directory contents:"
ls -la "${temp_dir}/${brand_name}"

# Print quarto configuration
echo "Quarto configuration:"
cat "${temp_dir}/_quarto.yml"

# Render
echo "Starting render process..."
cd "$temp_dir"
timeout 300 quarto render || {
    echo "Render failed or timed out!"
    echo "Current directory contents:"
    ls -la
    echo "Current working directory:"
    pwd
    cd ..
    exit 1
}
cd ..

# Move output
echo "Moving rendered output..."
mkdir -p "_site/${brand_name}"
mv "${temp_dir}/_site"/* "_site/${brand_name}/"

# Cleanup
echo "Cleaning up..."
rm -rf "$temp_dir"

echo "Finished processing $brand_name"