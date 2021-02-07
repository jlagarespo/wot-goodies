import discord
import os, subprocess

def run(args):
    try:
        return subprocess.check_output(args, stderr=subprocess.STDOUT, timeout=1.0)
    except subprocess.CalledProcessError as e:
        return e.output
    except subprocess.TimeoutExpired as e:
        return b'[wot++ bot] Timeout expired'

class BotClient(discord.Client):
    async def on_ready(self):
        print('Ready as', self.user)

    async def on_message(self, message):
        if message.author == client.user:
            return

        PREFIX='wot++'
        WPPFILE='code.wpp'

        if message.content.startswith(PREFIX):
            code = message.content[len(PREFIX):]
            with open(WPPFILE, 'w') as f:
                f.write(code)

            out = run(['w++', WPPFILE])
            await message.channel.send('```{}```'.format(out.decode('utf-8')+'\n'))

if __name__ == '__main__':
    print('Starting...')
    client = BotClient()
    client.run(os.environ['BOT_TOKEN'])
