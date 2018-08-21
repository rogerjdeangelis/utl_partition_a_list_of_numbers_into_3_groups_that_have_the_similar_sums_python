Partition a list of numbers into 3 groups that have the similar sums python

github
https://tinyurl.com/ybze5z27
https://github.com/rogerjdeangelis/utl_partition_a_list_of_numbers_into_3_groups_that_have_the_similar_sums_python

several alternate solutions(apprx solutions?)
https://tinyurl.com/yb7j3oud
https://stackoverflow.com/questions/41221874/divide-the-list-into-three-lists-such-that-their-sum-are-close-to-each-other

Formalhaut profile
https://stackoverflow.com/users/3467698/fomalhaut

I think this is considered an NP hard problem?

INPUT
=====

  Hardcoded to 3;
  s = [1,2,3,4,5,6,7,8];

EXAMPLE OUTPUT
--------------

Not Optimum

[8, 3, 2],
[7, 4, 1],
[6, 5]

Groups  Sums

 1      13
 2      12
 3      11


PROCESS
=======

* here is a python approximate solution based on group of three;
* it does not find the optimum solution;

%utl_submit_py64("
from copy import deepcopy;
s = [1,2,3,4,5,6,7,8];
s = sorted(s, reverse=True);
a = [[], [], []];
sum_a = [0, 0, 0];
for x in s:;
.    i = sum_a.index(min(sum_a));
.    sum_a[i] += x;
.    a[i].append(x);
def f(a):;
.    return ((sum(a[0]) - sum(s) / 3.0)**2 + (sum(a[1]) - sum(s) / 3.0)**2 + (sum(a[2]) - sum(s) / 3.0)**2) / 3;
fa = f(a);
while True:;
.    modified = False;
.    for i_from, i_to in [(0, 1), (0, 2), (1, 0), (1, 2), (2, 0), (2, 1)]:;
.        for j in range(len(a[i_from])):;
.            a_new = deepcopy(a);
.            a_new[i_to].append(a_new[i_from][j]);
.            del a_new[i_from][j];
.            fa_new = f(a_new);
.            if fa_new < fa:;
.                a = a_new;
.                fa = fa_new;
.                modified = True;
.                break;
.        if modified:;
.            break;
.    for i_from, i_to in [(0, 1), (0, 2), (1, 0), (1, 2), (2, 0), (2, 1)]:;
.        for j_from in range(len(a[i_from])):;
.            for j_to in range(len(a[i_to])):;
.                a_new = deepcopy(a);
.                a_new[i_to].append(a_new[i_from][j_from]);
.                a_new[i_from].append(a_new[i_to][j_to]);
.                del a_new[i_from][j_from];
.                del a_new[i_to][j_to];
.                fa_new = f(a_new);
.                if fa_new < fa:;
.                    a = a_new;
.                    fa = fa_new;
.                    modified = True;
.                    break;
.            if modified:;
.                break;
.        if modified:;
.            break;
.    if not modified:;
.        break;
print(a, f(a));
");

OUTPUT
======

([[8, 3, 2], [7, 4, 1], [6, 5]], 0.6666666666666666)

mse = 0.6666666666666666

/* data and output is internal */

