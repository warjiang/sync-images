#!/bin/bash
#set -x
SHELL_FOLDER=$(pwd)
images=$(cat $SHELL_FOLDER/images.list | grep -v '^\s*$' | grep -v '^#')


for line in $images; do
    echo "start sync $line"
    origin_image=$(echo $line | awk -F '=>' '{print $1}')
    target_image=$(echo $line | awk -F '=>' '{print $2}')
    skopeo copy --dest-creds \
          ${{ secrets.DEST_REGISTRY_USER }}:${{ secrets.DEST_REGISTRY_PASSWORD }} \
          docker://${origin_image} \
          docker://${{ secrets.DEST_REGISTRY }}/${target_image}
    echo "sync $line done"
done