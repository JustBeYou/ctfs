import angr
import claripy

p = angr.Project('./silkroad.elf')
flag_chars = [claripy.BVS('flag_%d' % i, 8) for i in range(10)]
flag = claripy.Concat(*flag_chars)
st = p.factory.full_init_state(
            args=['./silkroad.elf'],
            add_options=angr.options.unicorn,
            stdin=flag,
)

for k in flag_chars:
    st.solver.add(
            st.solver.Or(
                st.solver.And(k >= ord('0'), k <= ord('9')),
                k == ord('\n'),
                k == 0,
            )
    )

sm = p.factory.simulation_manager(st)
sm.use_technique(angr.exploration_techniques.Explorer(find=0x4017B9))
sm.run()

correct_input = sm.one_found.posix.dumps(0)
print( correct_input)
