
"""
This script crawls through subdirectories of software/
and generates include files
"""

import os
import sys

# sorting of version numbers
from distutils.version import LooseVersion

#-------------------------------------------------------------------------------

def repeat_to_length(string_to_expand, length):

    return (string_to_expand * ((length/len(string_to_expand))+1))[:length]

#-------------------------------------------------------------------------------

def get_divider_line(max_column_width, char, skip_first=False):

    if skip_first:
        text = ['|']
    else:
        text = ['+']
    for i, width in enumerate(max_column_width):
        if i == 0 and skip_first:
            text.append(repeat_to_length(' ', width + 2))
        else:
            text.append(repeat_to_length(char, width + 2))
        text.append('+')
    return ''.join(text)

#-------------------------------------------------------------------------------

def get_sphinx_table(table):

    num_columns = len(table[0])

    max_column_width = []
    for i in range(num_columns):
        max_column_width.append(0)

    for line in table:
        if len(line) != num_columns:
            sys.stderr.write("ERROR: number of columns inconsistent in line %s\n" % line)
            sys.exit(-1)
        for i in range(num_columns):
            width = len(line[i])
            if width > max_column_width[i]:
                max_column_width[i] = width

    text = []
    for i, line in enumerate(table):
        skip_first = False
        if i == 0:
            text.append(get_divider_line(max_column_width, '-'))
        elif i == 1:
            text.append(get_divider_line(max_column_width, '='))
        else:
            # do not repeat program name if it is in the line above
            skip_first = (table[i][0] == table[i-1][0])
            text.append(get_divider_line(max_column_width, '-', skip_first))
        text2 = ['|']
        for j, word in enumerate(line):
            if j == 0 and skip_first:
                word2 = ' '
            else:
                word2 = word
            text2.append(' %s%s ' % (word2, repeat_to_length(' ', max_column_width[j] - len(word2))))
            text2.append('|')
        text.append(''.join(text2))
    text.append(get_divider_line(max_column_width, '-'))

    return '\n'.join(text)

#-------------------------------------------------------------------------------

def generate_table(table, programs, version_d, systems, section, only_program=''):

    if only_program != '':
        programs_local = [only_program]
    else:
        programs_local = programs[:]

    for program in programs_local:
        for version in version_d[program]:
            doc_exists = []
            for system in systems:
                doc_exists.append(os.path.isfile(os.path.join('software', program, system.lower(), version, '%s.rst' % section)))
            if any(doc_exists):
                line = []
                if only_program == '':
                    line.append(":doc:`%s <software/%s/general>`" % (program, program))
                line.append(version)
                for i, system in enumerate(systems):
                    if doc_exists[i]:
                        if only_program == '':
                            line.append(":doc:`x <software/%s/%s/%s/%s>`" % (program, system.lower(), version, section))
                        else:
                            line.append(":doc:`x <%s/%s/%s>`" % (system.lower(), version, section))
                    else:
                        line.append('')
                table.append(line)

    return table

#-------------------------------------------------------------------------------

def main():

    systems = ['Beskow', 'Lindgren', 'Povel', 'Ellen', 'Zorn']

    software_path = os.path.join(os.getcwd(), 'software')

    # get list of all installed programs
    programs = []
    version_d = {}
    for root, _, filenames in os.walk(software_path):
        for name in filenames:
            if name == 'general.rst':
                program = root.split('/')[-1]
                programs.append(program)
                version_d[program] = []

    # get list of all installed versions
    for root, _, filenames in os.walk(software_path):
        for name in filenames:
            if name == 'running.rst' or name == 'building.rst':
                version = root.split('/')[-1]
                program = root.split('/')[-3]
                if version not in version_d[program]:
                    version_d[program].append(version)

    # sort programs
    programs = sorted(programs, key=lambda s: s.lower())

    # sort versions
    for program in programs:
        version_d[program].sort(reverse=True, key=LooseVersion)

    # build include files which contain title and version
    for program in programs:
        for version in version_d[program]:
            for system in systems:
                for section in ['Running', 'Building']:
                    if os.path.isfile(os.path.join('software', program, system.lower(), version, '%s.rst' % section.lower())):
                        with open(os.path.join('software', program, system.lower(), version, '%s.inc' % section.lower()), 'w') as f_include:
                            text = '%s %s %s on %s' % (section, program, version, system)
                            f_include.write('%s\n' % text)
                            f_include.write('%s\n' % repeat_to_length('=', len(text)))

    # here we remove Lindgren
    # we need it for the above until we also remove the files from the repo
    systems.remove('Lindgren')

    top_line_program = []
    top_line_program.append('Version')
    for system in systems:
        top_line_program.append(system)

    # this generates a version overview for each program separately
    for program in programs:
        with open(os.path.join('software', program, 'include.inc'), 'w') as f_program:
            title = 'Running %s at PDC' % program
            f_program.write('%s\n' % title)
            f_program.write('%s\n' % repeat_to_length('=', len(title)))
            table = []
            table.append(top_line_program)
            table = generate_table(table, programs, version_d, systems, 'running', only_program=program)
            f_program.write(get_sphinx_table(table))

    # generate main index file
    with open('include.inc', 'w') as include_file:

        top_line = []
        top_line.append('Soinclude_file')
        top_line.append('Version')
        for system in systems:
            top_line.append(system)

        include_file.write('\n\nSoftware at PDC\n')
        include_file.write('===============\n')

        include_file.write('\n\nRunning software\n')
        include_file.write('----------------\n')

        table = []
        table.append(top_line)
        table = generate_table(table, programs, version_d, systems, 'running')
        include_file.write(get_sphinx_table(table))

        include_file.write('\n\n\nBuilding software\n')
        include_file.write('-----------------\n\n')

        table = []
        table.append(top_line)
        table = generate_table(table, programs, version_d, systems, 'building')
        include_file.write(get_sphinx_table(table))

#-------------------------------------------------------------------------------

if __name__ == '__main__':
    main()
