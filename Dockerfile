# Use cuhkhaosun/base as the base image
FROM cuhkhaosun/base

# Update the base image and install necessary packages
RUN apt-get update && apt-get install -y \
    curl tar fastqc cutadapt igzip \
    && apt-get clean

# Install Trim Galore
RUN curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.10.tar.gz -o trim_galore.tar.gz && \
    tar xvzf trim_galore.tar.gz && \
    rm trim_galore.tar.gz

# Set the Trim Galore executable in the PATH
ENV PATH="/root/TrimGalore-0.6.10/:$PATH"

# Default command to verify Trim Galore installation
CMD ["trim_galore", "--help"]
