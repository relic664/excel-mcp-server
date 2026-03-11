FROM python:3.10-slim

# Install uv for fast dependency management
RUN pip install --no-cache-dir uv

# Set working directory
WORKDIR /app

# Copy dependency files and source
COPY pyproject.toml uv.lock README.md ./
COPY src/ ./src/

# Install dependencies using uv
RUN uv pip install --system --no-cache-dir .

# Expose port for HTTP mode
EXPOSE 8000

# Default to streamable HTTP mode
ENTRYPOINT ["python", "-m", "excel_mcp"]

CMD ["streamable-http"]