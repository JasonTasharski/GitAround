# GitAround

## Solutions to Likely Pull Problems
1. If the update you're pulling added seed data for the first time, run "rake db:seed" in the terminal. If you do this more than once, you will get duplicates of the seed data with different ids. You should only need to do this once.
2. If the seed data changes, you may need to run "rake db:reset db:migrate". Make sure your postgresql and any rails consoles aren't running when you do this; you can restart them afterwards.
	* If you end up with duplicate data, you will need to do this.
	* If you aren't sure if you have duplicate data, check in the rails console.
3. If your migrations changed but your seed data didn't, you will only need to run "rake db:migrate" after pulling.

## Reminders on Pushing
1. Don't push to master.
2. Make sure you're working on a branch with "git branch".
3. If you aren't, change to a branch for the feature you're working on with "git checkout -b featureName".
4. When you push from that branch, run "git push origin featurename", and a repository for that branch will be created on github.