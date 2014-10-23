
'''
This script crawls through subdirectories of software/
and generates index_generated.rst.inc
'''

import os
import sys

# globals

SYSTEMS = ['Beskow', 'Lindgren', 'Povel', 'Zorn']

#-------------------------------------------------------------------------------

def repeat_to_length(string_to_expand, length):
    return (string_to_expand * ((length/len(string_to_expand))+1))[:length]

#-------------------------------------------------------------------------------

def get_divider_line(max_column_width, c, skip_first=False):
    if skip_first:
        s = ['|']
    else:
        s = ['+']
    for i, width in enumerate(max_column_width):
        if i == 0 and skip_first:
            s.append(repeat_to_length(' ', width + 2))
        else:
            s.append(repeat_to_length(c, width + 2))
        s.append('+')
    return ''.join(s)

#-------------------------------------------------------------------------------

def get_sphinx_table(table):

    num_lines = len(table)
    num_columns = len(table[0])

    max_column_width = []
    for i in range(num_columns):
        max_column_width.append(0)

    for line in table:
        if len(line) != num_columns:
            sys.stderr.write("ERROR: number of columns inconsistent\n")
            sys.exit(-1)
        for i in range(num_columns):
            width = len(line[i])
            if width > max_column_width[i]:
                max_column_width[i] = width

    s = []
    for i, line in enumerate(table):
        skip_first = False
        if i == 0:
            s.append(get_divider_line(max_column_width, '-'))
        elif i == 1:
            s.append(get_divider_line(max_column_width, '='))
        else:
            # do not repeat program name if it is in the line above
            skip_first = (table[i][0] == table[i-1][0])
            s.append(get_divider_line(max_column_width, '-', skip_first))
        s3 = ['|']
        for j, w in enumerate(line):
            if j == 0 and skip_first:
                z = ' '
            else:
                z = w
            s3.append(' %s%s ' % (z, repeat_to_length(' ', max_column_width[j] - len(z))))
            s3.append('|')
        s.append(''.join(s3))
    s.append(get_divider_line(max_column_width, '-'))

    return '\n'.join(s)

#-------------------------------------------------------------------------------

def generate_table(table, programs, version_d, systems, section):

    for program in programs:
        for version in version_d[program]:
            doc_exists = []
            for system in systems:
                doc_exists.append(os.path.isfile(os.path.join('software', program, system.lower(), version, '%s.rst' % section)))
            if any(doc_exists):
                line = []
                line.append(":doc:`%s <software/%s/general>`" % (program, program))
                line.append(version)
                for i, system in enumerate(systems):
                    if doc_exists[i]:
                        line.append(":doc:`x <software/%s/%s/%s/%s>`" % (program, system.lower(), version, section))
                    else:
                        line.append('')
                table.append(line)

    return table

#-------------------------------------------------------------------------------

software_path = os.path.join(os.getcwd(), 'software')

# get list of all installed programs
programs = []
version_d = {}
for root, dirnames, filenames in os.walk(software_path):
    for f in filenames:
        if f == 'general.rst':
            program = root.split('/')[-1]
            programs.append(program)
            version_d[program] = []

# get list of all installed versions
for root, dirnames, filenames in os.walk(software_path):
    for f in filenames:
        if f == 'running.rst' or f == 'building.rst':
            version = root.split('/')[-1]
            program = root.split('/')[-3]
            if version not in version_d[program]:
                version_d[program].append(version)

top_line = []
top_line.append('Software')
top_line.append('Version')
for system in SYSTEMS:
    top_line.append(system)

with open('index_generated.rst.inc', 'w') as f:

    f.write('\n\nRunning software at PDC\n')
    f.write('-----------------------\n\n')
    
    table = []
    table.append(top_line)
    table = generate_table(table, programs, version_d, SYSTEMS, 'running')
    f.write(get_sphinx_table(table))

    f.write('\n\n\nBuilding software at PDC\n')
    f.write('------------------------\n\n')
    
    table = []
    table.append(top_line)
    table = generate_table(table, programs, version_d, SYSTEMS, 'building')
    f.write(get_sphinx_table(table))
