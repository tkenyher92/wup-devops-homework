# wup-devops-homework
Welcome, weary traveler! You have arrived at W.UP's homework for applicants of our DevOps Engineer position. Here are the instructions you should follow. Good luck, and may the odds be ever in your favour!

## the app itself
What you can find here is a general spring boot application, nothing too fancy. Here's a little documentation to get you started.
TODO: env vars + config files

## the exercise itself
What we would like to ask of you is the following:

1. Fork the repository.
2. Build a pipeline that is triggered whenever there is a push or a pull request opened/reopened/editet to the main branch, with the following steps:
    1. Unit tests ran
    2. docker image built
    3. docker image is pushed to an artifact repository
    4. the application is deployed to any cloud provider (100% your choice)
    (5. somewhere in between there are scans running for any static code or security analyser - totally optional)
3. The catch: place a shell script in the container that is ran every hour to check whether the env var IS_EVERYTHING_OK is true; if it's not, it should log it to stderr.

Please send us URL for **the forked repository** and the **URL for the webapplication**.
Thank you!
