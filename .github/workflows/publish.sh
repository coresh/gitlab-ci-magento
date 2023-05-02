name: publish

on: [push]

jobs:
  publish-action-docker-image:
    runs-on: ubuntu-latest
    environment: docker-image-builder

    steps:
      - uses: actions/checkout@v2

      - name: Login to GitHub Container Registry
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Building magento-actions docker image
        run: |
          cd registry/opensearch
          docker build . --tag ghcr.io/mad-i-t/gitlab-ci-magento/opensearch:2.5.0
          docker push ghcr.io/mad-i-t/gitlab-ci-magento/opensearch:2.5.0