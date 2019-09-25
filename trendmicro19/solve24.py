import angr
import claripy
import logging

logging.getLogger('angr').setLevel('INFO')
def main():
    proj = angr.Project('./much_ado_about_nothing', load_options={"auto_load_libs": False})
    argv1 = claripy.BVS("argv1", (24 + 7) * 8)
    initial_state = proj.factory.entry_state(args=["./much_ado_about_nothing", argv1])


    initial_state.add_constraints(argv1.chop(8)[0] == 'T')
    initial_state.add_constraints(argv1.chop(8)[1] == 'M')
    initial_state.add_constraints(argv1.chop(8)[2] == 'C')
    initial_state.add_constraints(argv1.chop(8)[3] == 'T')
    initial_state.add_constraints(argv1.chop(8)[4] == 'F')
    initial_state.add_constraints(argv1.chop(8)[5] == '{')
    initial_state.add_constraints(argv1.chop(8)[-1] == '}')
    for i, byte in enumerate(argv1.chop(8)[:-1]):
        if i <= 5: continue
        print ("Add constrait for byte {}".format(i))
        initial_state.add_constraints(claripy.Or(
            claripy.And(byte >= ord('a'), byte <= ord('z')),
            claripy.And(byte >= ord('A'), byte <= ord('Z'))
            )
        )

    sm = proj.factory.simulation_manager(initial_state)
    sm.explore(find=0x4027E5, avoid=[0x4027A8, 0x40280D])
    found = sm.found[0]
    print (found.solver.eval(argv1, cast_to=bytes))

main()
