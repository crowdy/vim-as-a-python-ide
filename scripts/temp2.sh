#               A---B---C---D---E  master
#                    \
#                     F---G---H---I---J  next
#                                      \
#                                       K---L---M  topic
mkdir temp2
cd temp2
git init
touch a.py
echo "print('A')" >> a.py
git add a.py
git commit -a -m "A"
echo "print('B')" >> a.py
git commit -a -m "B"
echo "print('C')" >> a.py
git commit -a -m "C"
echo "print('D')" >> a.py
git commit -a -m "D"
echo "print('E')" >> a.py
git commit -a -m "E"
git branch next HEAD~3
git checkout next
echo "print('F')" >> a.py
git commit -a -m "F"
echo "print('G')" >> a.py
git commit -a -m "G"
echo "print('H')" >> a.py
git commit -a -m "H"
echo "print('I')" >> a.py
git commit -a -m "I"
echo "print('J')" >> a.py
git commit -a -m "J"
git branch topic
git checkout topic
echo "print('K')" >> a.py
git commit -a -m "K"
echo "print('L')" >> a.py
git commit -a -m "L"
echo "print('M')" >> a.py
git commit -a -m "M"



