# Test history of the relation join tables

### Brief
- Author has many books
- Book has many authors
- AuthorBookRelation is the M:N relation table of them
- AuthorBookRelation should be stored as a history record

### Usage
- Go to `/books`
- Click to edit a book
- Choose a author from drop down list
- Click `Add new author`
- The temporary author will be stored but is not shown `It is a BUG, see Further for more detail`
- After adding some authors, click to `Update bool` to add all the author to the relation table
- Click to `History` to show the history of relation table

### Further
- Fix the bug: require section to store temporary author list between screens
