rule all:
    input:
        expand("{sample}_count.txt",sample=['A', 'B', 'C'])

rule scale_information:
    input:
        "{sample}.txt"
    output:
        "{sample}_count.txt"
    shell:
        "cat {input} | wc -c > {output}"

rule create_file:
    output:
        "A.txt"
    shell:
        "touch {output}"

rule write_information:
    output:
        "B.txt"
    shell:
        """
        echo "I've created a new file" > {output}
        """

rule copy_information:
   input:
       "B.txt"
   output:
       "C.txt"
   shell:
       "cat {input} > {output}"

rule calling:
    input:
        os.path.join("data", "{data/reference}")

