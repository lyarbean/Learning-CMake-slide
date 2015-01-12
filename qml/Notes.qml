pragma Singleton
import QtQuick 2.3

QtObject {
    property variant notes: {
        'project' : 'Set a name, version, and enable languages for the entire project.
         project(<PROJECT-NAME>
                  [VERSION <major>[.<minor>[.<patch>[.<tweak>]]]]
                  [LANGUAGES <language-name>...])'
        ,
        'find_package': 'Load settings for an external project.',
        'set': 'Set a CMake, cache or environment variable to a given value.',
        'include': 'Load and run CMake code from a file or module.',
        'add_executable': 'Add an executable to the project using the specified source files.',
        'target_link_libraries': 'Link a target to given libraries.',
        'target_include_directories':'Add include directories to a target.',
        'target_compile_definitions':'Add compile definitions to a target.',
        'set_property': 'Set a named property in a given scope.
        set_property(<GLOBAL              |
        DIRECTORY [dir]                   |
        TARGET    [target1 [target2 ...]] |
        SOURCE    [src1 [src2 ...]]       |
        TEST      [test1 [test2 ...]]     |
        CACHE     [entry1 [entry2 ...]]>
        [APPEND] [APPEND_STRING]
        PROPERTY <name> [value1 [value2 ...]])',
        'install':'Specify rules to run at install time.
        install(TARGETS targets... [EXPORT <export-name>]
        [[ARCHIVE|LIBRARY|RUNTIME|FRAMEWORK|BUNDLE|
        PRIVATE_HEADER|PUBLIC_HEADER|RESOURCE]
        [DESTINATION <dir>]
        [INCLUDES DESTINATION [<dir> ...]]
        [PERMISSIONS permissions...]
        [CONFIGURATIONS [Debug|Release|...]]
        [COMPONENT <component>]
        [OPTIONAL] [NAMELINK_ONLY|NAMELINK_SKIP]
        ] [...])',
        'include_directories': 'Add include directories to the build.
        include_directories([AFTER|BEFORE] [SYSTEM] dir1 [dir2 ...])',
        'link_directories':'Specify directories in which the linker will look for libraries.
        link_directories(directory1 directory2 ...)',
        'add_subdirectory': 'Add a subdirectory to the build.
        add_subdirectory(source_dir [binary_dir] [EXCLUDE_FROM_ALL])',
        'add_jar':'To create a jar <name>.jar
        add_jar(<name>
        [SOURCES] source1 [source2 ...] [resource1 ...]
        [INCLUDE_JARS jar1 [jar2 ...]]
        [ENTRY_POINT entry]
        [VERSION version]
        [MANIFEST manifest]
        [OUTPUT_NAME name]
        [OUTPUT_DIR dir]
        )'
    }
}
