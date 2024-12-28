import launch
import launch.actions
import launch.substitutions
import launch_ros.actions


def generate_launch_description():

    talker = launch_ros.actions.Node(
        package = 'mypkg',
        executable = 'talker',
    )
    listener = launch_ros.actions.Node(
        package = 'mypkg',
        executable = 'listener',
        output = 'screen', #標準出力に表示するため
    )

    return launch.LaunchDescription([talker, listener])
