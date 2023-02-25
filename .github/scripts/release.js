// .github/scripts/release.js
// GitHub release generation.

// BRANCH_OR_TAG:         The branch or tag name that is being released.
// CHANGE_LOG_CONTENT:    The changelog to include in the release.

// CI only script

module.exports = async ({github, context, core}) => {
  try {

    const result = await github.rest.repos.createRelease({
      body: process.env.CHANGE_LOG_CONTENT,
      draft: true,
      name: "Release " + process.env.BRANCH_OR_TAG,
      owner: context.repo.owner,
      prerelease: false,
      repo: context.repo.repo,
      tag_name: process.env.BRANCH_OR_TAG,
    });

    return result

  } catch (error) {

    core.setFailed(error.message);

  }

}
