CPATH='.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
if [[ -f student-submission/ListExamples.java ]]
then
    cp student-submission/ListExamples.java grading-area/
    cp TestListExamples.java grading-area/
else
    echo "You did not submit ListExamples.java"
    exit 1
fi

cd grading-area

javac -cp $CPATH *.java

if [[ $? -ne 0 ]]
then
    echo "failed to compile"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > result.txt

if [[ $? -ne 0 ]]
then
    lastline=$(cat result.txt | tail -n 2 | head -n 1)
    tests=$(echo $lastline | awk -F'[, ]' '{print $3}')
    failures=$(echo $lastline | awk -F'[, ]' '{print $6}')
    successes=$(( tests - failures ))
else
    lastline=$(cat result.txt | tail -n 2 | head -n 1)
    tests=$(echo $lastline | awk -F'[ (]' '{print $3}')
    successes=$tests
fi

echo "Your score is $successes / $tests"
