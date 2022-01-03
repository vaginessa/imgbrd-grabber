project(lib)

find_package(Qt6 COMPONENTS Concurrent Core Gui Network NetworkAuth Qml Sql Xml REQUIRED) # Qt6::Gui required for some classes such as QPixmap
set(QT_LIBRARIES Qt6::Concurrent Qt6::Core Qt6::Gui Qt6::Network Qt6::NetworkAuth Qt6::Qml Qt6::Sql Qt6::Xml)

# Android specials
if(ANDROID)
	#find_package(Qt6 COMPONENTS AndroidExtras REQUIRED)
	#set(QT_LIBRARIES ${QT_LIBRARIES} Qt6::AndroidExtras)
endif()

file(GLOB_RECURSE SOURCES "src/*.cpp" "src/*.c")
include_directories("src/")

if(WIN_FILE_PROPS)
	set(LIBS ${LIBS} propsys)
else()
	include(ListFilterRegex)
	listFilterRegex(SOURCES "windows-file-property.*")
	listFilterRegex(SOURCES "windows-url-protocol.*")
endif()

add_library(${PROJECT_NAME} STATIC ${SOURCES})
target_link_libraries(${PROJECT_NAME} ${QT_LIBRARIES} ${LIBS})

# Pre-compiled header
if(USE_PCH)
	cotire(${PROJECT_NAME})
endif()
