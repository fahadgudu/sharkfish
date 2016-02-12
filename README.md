# sharkfish
synchronization problem

S sharks and F fish live in an ocean with only ONE sea food-point serving sea-weed having N seats. A Fish can dine at a sea-food point
as long as a shark does not arrive there simultaneously. If the shark sees the fish, it must eat the fish. There are N seats at the sea-food point, S sharks and F fish. Our sharks and fish love sea-weed, however, shark does not mind eating fish as well.

Please write code to simulate sharks and fish. Create one thread for each simulated shark, and one thread for each simulated fish. Each shark thread repeatedly sleeps/blocks and then wakes up to eat from the sea-food point, by occupying a seat available there. Each fish thread behaves similarly. Each shark and fish iterates a fixed number of times before terminating. Your should synchronize the sharks and the fish to meet the following requirements:
1. Shark and fish should not eat at the same time. i.e. if a shark is occupying a seat at the sea-food point then no fish should be sitting at any seat in the sea-food point. Similarly, if a fish is sitting at a seat in the sea-food point, then no shark should be eating there. This will ensure that the fish is not consumed by the sharks.
2. Only one fish or one shark can sit at a given seat at any particular time.
3. Neither sharks nor fish should starve. A shark or fish that wants to eat should eventually be able to eat. e.g. a solution that permanently prevents all fish from eating would be unacceptable. So would a solution in which sharks were always given priority over fish. When we actually test your solution, each simulated
shark and fish will eat a finite number of times; however, even if the simulation were allowed to run forever, neither sharks nor fish should starve.
4. Your synchronization mechanism should not impose an upper bound on the number of seats that can be occupied simultaneously. i.e. if there are enough animals, it should be possible for them to occupy all available seats simultaneously.

Provide a file synch.c to provide solution to synchronization. Your solution should be implemented entirely in this file.
It can contain six functions, which are invoked by the "shark and fish simulation" created by you.

sharkb4eating: called each time a shark eats, before it eats
fishb4eating: called each time a fish eats, before it eats
sharkafteating: called each time a shark eats, after it eats
fishafteating: called each time a fish eats, after it eats
sharkfishsyncinit: called only once, before the shark and fish are created
sharfishsynccleanup: called only once, after all sharks and fish have finished
Implement your solution using functions as described above. 

Use the sharkb4eating and fishb4eating functions to make animals wait before eating, when waiting is necessary to satisfy the synchronization requirements. e.g. if a
fish is eating and a shark arrives at sea-food point, the shark must be prevented from sitting in, at least, until the fish has finished, otherwise requirement.1 will be violated.  To enforce this, your implementation of sharkb4eating should cause that shark (thread) to block until it is OK for it to eat. In other words, sharkb4eating
should not return until it is OK for the shark to eat, since once it returns the shark will eat.

It is up to you to decide when it is OK for a shark or fish to eat. You should answer this question when designing the synchronization mechanism that satisfies the requirements.

You may use sharkfishsyncinit to create or initialize any synchronization primitives or variables that your solution requires.

Testing
You can launch the shark and fish simulation menu using "syncproblem" command. In its short form, it should take 4 parameters, i.e., "syncproblem 2 3 4 6"
These parameters specify the number of seats, the number of sharks, the number of fish, and the number of eat/sleep iterations each animal makes before finishing.
Thus, the command above will simulate 3 sharks and 4 fish eating using 2 seats in the food-point, with each shark and fish iterating 6 times. A longer version should allow you to specify the amount of time each animal spends eating and sleeping.

When the simulation program terminates, it should print simulation statistics: 
utilization of the seats and the average waiting times for sharks and for fish. 
These statistics will tell whether your synchronization mechanism satisfies the synchronization requirements. When there are equal numbers of sharks and fish, a synchronization mechanism that does not starve sharks or fish should show similar waiting times for sharks and fish. Also, for a given number of seats, an efficient
solution should show increasing bowl utilization if we run a series of simulations with larger and larger numbers of animals.
