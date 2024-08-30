# Wally Dotplot Analysis Repository

This repository contains scripts and files used for creating BED files and running Wally dotplots for genomic inversion analysis. Below is a brief description of each file and its purpose.

## Files and Descriptions

### \`createCarrierBED.py\`
This Python script creates a BED file that attributes inversion regions to their respective carrier and non-carrier samples.

**Usage:**
\`\`\`bash
python createCarrierBED.py
\`\`\`

### \`createCarrierBED.sh\`
A Bash script that performs the same task as \`createCarrierBED.py\`, creating a BED file associating inversion regions with carrier and non-carrier samples.

**Usage:**
\`\`\`bash
bash createCarrierBED.sh
\`\`\`

### \`wally_clean.bed\`
This is the final version of the BED file used for Wally dotplots. It contains the cleaned and processed inversion regions.

### \`wally_ngmlr.sh\`
This script runs Wally and generates matchplots for the NGMLR callset.

**Usage:**
\`\`\`bash
bash wally_ngmlr.sh
\`\`\`

### \`wally_sniffles.sh\`
This script runs Wally and generates matchplots for the Sniffles callset.

**Usage:**
\`\`\`bash
bash wally_sniffles.sh
\`\`\`

## Getting Started

Clone the repository and ensure you have the necessary dependencies installed. Each script can be run directly from a Unix-like terminal.

\`\`\`bash
git clone https://github.com/yourusername/wally_dotplot_analysis.git
cd wally_dotplot_analysis
\`\`\`

## Prerequisites

- Python 3.x (for running \`createCarrierBED.py\`)
- Bash shell (for running the shell scripts)
- Wally toolset installed and properly configured

## Usage

Each script can be run independently based on your specific needs. Refer to the descriptions above for the usage of each file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to the developers and contributors of the tools used in this repository.
EOL

echo "README.md file has been created."