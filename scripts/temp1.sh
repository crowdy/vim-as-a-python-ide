#
#
#      A---B---C topic
#     /
#D---E---F---G master
mkdir temp
cd temp
git init
touch a.py
echo "print('D')" >> a.py
git add a.py
git commit -a -m "D"
echo "print('E')" >> a.py
git commit -a -m "E"
echo "print('F')" >> a.py
git commit -a -m "F"
echo "print('G')" >> a.py
git commit -a -m "G"
git branch topic HEAD~2
git checkout topic
echo "print('A')" >> a.py
git commit -a -m "A"
echo "print('B')" >> a.py
git commit -a -m "B"
echo "print('c')" >> a.py
git commit -a -m "C"




