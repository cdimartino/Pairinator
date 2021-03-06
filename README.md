## Matchmaker! ##

Pair up students randomly and keep track of their historical pairings.

Makes it easy to make truly random pairings each day.

# Usage #

ruby pairinator.rb <cohort_file>

cohort file should be seeded with JSON data to start with, and will be updated each run.

```json
{
  "Bob Smith": [],
  "John Doe": [],
  "Harry Houdini": [],
  "Barack Obama": [],
  "Tina Turner": []
}
```
# Example #

```shell
$ for i in `seq 1 5`; do echo Run $i; ruby pairinator.rb pairs.json; echo; done                         rbenv:2.2.0
Run 1
Pair: John Doe, Tina Turner
Pair: Bob Smith, Barack Obama
Solo: Harry Houdini

Run 2
Pair: Tina Turner, Barack Obama
Pair: Harry Houdini, John Doe
Solo: Bob Smith

Run 3
Pair: Bob Smith, Harry Houdini
Pair: Tina Turner, John Doe
Solo: Barack Obama

Run 4
Pair: Barack Obama, John Doe
Pair: Bob Smith, Tina Turner
Solo: Harry Houdini

Run 5
Pair: Tina Turner, Harry Houdini
Pair: Barack Obama, Bob Smith
Solo: John Doe
```
