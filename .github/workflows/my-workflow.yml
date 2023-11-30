name: Deploy Nginx

on:
  push:
    branches:
    - 'main'
  workflow_dispatch: 

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:

    - name: code checkout
      uses: actions/checkout@v4

    - name: install the gcloud cli
      uses: google-github-actions/setup-gcloud@v0
      with:
        project_id: ${{ secrets.GOOGLE_PROJECT }}
        service_account_key: ${{ secrets.GOOGLE_APPLICATION_CREDENTIALS }}
        export_default_credentials: true

    - name: Check gcloud cli Version
      run: |
        gcloud --version

    - name: build and push the docker image
      env:
        GOOGLE_PROJECT: ${{ secrets.GOOGLE_PROJECT }}
      run: |
         gcloud auth configure-docker us-east1-docker.pkg.dev --quiet
         docker build -t us-east1-docker.pkg.dev/$GOOGLE_PROJECT/my-reg/my-reg:$GITHUB_RUN_NUMBER .
         docker push us-east1-docker.pkg.dev/$GOOGLE_PROJECT/my-reg/my-reg:$GITHUB_RUN_NUMBER
 
      
