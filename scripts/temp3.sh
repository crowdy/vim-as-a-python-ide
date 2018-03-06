#                                       H---I---J topicB
#                                      /
#                             E---F---G  topicA
#                            /
#               A---B---C---D  master
mkdir temp3
cd temp3
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
git branch topicA HEAD
git checkout topicA
echo "print('E')" >> a.py
git commit -a -m "E"
echo "print('F')" >> a.py
git commit -a -m "F"
echo "print('G')" >> a.py
git commit -a -m "G"
git branch topicB
git checkout topicB
echo "print('H')" >> a.py
git commit -a -m "H"
echo "print('I')" >> a.py
git commit -a -m "I"
echo "print('J')" >> a.py
git commit -a -m "J"
