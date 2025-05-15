# Exercise-2_HPC_Assignment
These are the commands used to answer the practical assignment.

**Note: The scripts are attached in the repo**

## Project structure
Using the 'tree' command, here's the structure:
![image](https://github.com/user-attachments/assets/089bbc6c-e9a4-45c9-8177-7f9001815f45)


## EXERCISE ONE: GITHUB
### 
_#Forked the original repository and cloned it into git_  
git clone https://github.com/VanessaWangari/Eneza-Interns-Profiles.git  
_#Changed directory_  
cd Eneza-Interns-Profiles/  
_#Created branch  ‘adding_my_profile’_  
git checkout -b adding_my_profile  
_#Created and edited the READ.md file with the details provided in the assignment_  
nano README.md  
_#Staging the file changes for next commit_  
git add README.md  
_#Committing changes with description "Adding Vanessa's profile to README file"_  
git commit -m "Adding Vanessa's profile to README file"  
#Pushing the changes to the forked repo  
git push origin adding_my_profile  
#Added my photo to the README file directly from GitHub and committed the changes.  

# EXERCISE TWO: HPC
_#Login and change to HPC_  
ssh vwangari@hpc01.icipe.org  
bash  
_#Making and changing into the directory for the whole assignment and question 1: Sum of the 10M integers_  
mkdir practical_assignment  
mkdir q1_sum  
cd q1_sum/  
_#making, editing and running a bash script that computes the question._  
nano sum_b.sh  
bash sum_b.sh  
_#making, editing and running a python script that computes the question._  
nano sum_p.py  
python --version  
python3 sum_p.py  
_#Comparing execution times of both scripts_  
time python3 sum_p.py  
chmod +x sum_b.sh   _#changing permissions so that it executes without the ‘bash’ command  
time ./sum_b.sh  
_#Making directory for question 2: File Operations with HIV Reference Genome_  
mkdir q2_file  
cd q2_file/  
_#Downloading the file from a URL_  
wget -O HIV_ref_genome.fasta "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?id=K03455&db=nuccore&report=fasta&extrafeat=null&conwithfeat=on&retmode=text"  
_#Splitting the File into 50 Random Parts using a script_  
nano splitdata.py  
python3 splitdata.py  
_#Ensuring that each part has a random number of lines, and the sum of lines across all split files matches the total lines in the original file_  
wc -l HIV_ref_genome.fasta  
cat hiv_parts/part_*.fasta | wc -l  
_#Counting the Number of Lines in Each Split File in a script_  
nano linecount.sh  
bash linecount.sh  
_#Counting nucleotides in each split file using a script and saving the results in a summary file named nucleotide_counts_summary.txt._  
nano nucleotide_count.sh  
bash nucleotide_count.sh  
cat nucleotide_counts_summary.txt  
_#Identifying the file with the highest GC content using a script and printing the file with the highest GC content._  
nano highgc_count.sh  
bash highgc_count.sh  
_#Combining results into a CSV_  
nano summary_fasta.sh  
bash summary_fasta.sh  
_#Compressing and transferring results from local to remote_   
[vwangari@hpc01 ]tar -czvf practical_assignment.tar.gz practical_assignment  
vanessa@Vee: scp vwangari@hpc01.icipe.org:/home/vwangari/practical_assignment.tar.gz .  






