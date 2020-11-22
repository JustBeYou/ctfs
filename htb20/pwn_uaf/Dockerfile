FROM ubuntu:20.10

ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt-get update --fix-missing && apt-get -y upgrade

# Install dependencies
RUN apt-get install -y xinetd

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create ctf-user
RUN groupadd -r ctf && useradd -r -g ctf ctf
RUN mkdir -p /home/ctf

# Configuration files/scripts
ADD config/ctf.xinetd /etc/xinetd.d/ctf
ADD config/run_xinetd.sh /etc/run_xinetd.sh
ADD config/run_challenge.sh /home/ctf/run_challenge.sh

# Challenge files
COPY --chown=ctf challenge/ /home/ctf/

# Set some proper permissions
RUN chown -R root:ctf /home/ctf
RUN chmod 750 /home/ctf/UAF
RUN chmod 750 /home/ctf/run_challenge.sh
CMD mv /home/ctf/flag.txt /home/ctf/[REDACTED]_flag.txt
RUN chmod 440 /home/ctf/flag.txt
RUN chmod 700 /etc/run_xinetd.sh

EXPOSE 1337

ENTRYPOINT ["/etc/run_xinetd.sh"]
