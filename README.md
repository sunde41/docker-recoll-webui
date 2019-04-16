# docker-recoll-webui
recoll with webui in a docker container

- optimized for docker running on a qnap nas
- creates a python standalone recoll server inside a docker container listening on port 80
- to start indexing run this command on your synology:
    `docker exec CONTAINER_ID recollindex`
- to run the indexer as a time-based task on a synology nas, use the task scheduler to run this recollindex.sh script:
    https://raw.githubusercontent.com/dsheyp/docker-recoll-webui/master/recollindex.sh
- change `CONTAINER_ID` and paths to your needs
- settings for recoll are stored in `/root/.recoll/recoll.conf`
- the path of what will be indexed is `/data`

# links
- WebUI homepage: https://github.com/koniu/recoll-webui
- Recoll homepage: http://www.lesbonscomptes.com/recoll

# installation steps
- in docker start the wizard to create a docker container from this image: mount `/homes` to `/homes` and mount `/homes/YOUR_USER_NAME` to `/root`, set up port mapping (defaults do also work)
- complete the following steps before you run the container
- download recoll.conf (https://raw.githubusercontent.com/dsheyp/docker-recoll-webui/master/recoll.conf) and place it in `/volume1/homes/YOUR_USER_NAME/.recoll/`
- modify `recoll.conf` (change the user name, ...)
- to run the indexer as a time-based task on a synology nas download `recollindex.sh` (https://raw.githubusercontent.com/dsheyp/docker-recoll-webui/master/recollindex.sh), place it somewhere on your synology, make it executable (in a shell run: `chmod 775 recollindex.sh`) and remember to modify `CONTAINER_ID` and paths
- then set up an automated task in the control panel of your synology with task scheduler and point it to `recollindex.sh`
