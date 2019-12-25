/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    libpcap-demo.c
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    25/12 2019 11:22
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        25/12 2019      create the file
 * 
 *     last modified: 25/12 2019 11:22
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <pcap/pcap.h>

typedef struct {
    struct pcap_pkthdr header;
    const unsigned char *data;
} pcap_frame_t;

typedef struct {
    pcap_t *handle;
} pcap_demo_state_t;

static pcap_demo_state_t g_running_state;

static void _pcap_get_frame(pcap_t *handle, pcap_frame_t *pcap_frame)
{
    pcap_frame->data = pcap_next(handle, &pcap_frame->header);
}

static pcap_t *_pcap_init(void)
{
#define PCAP_DATABUF_MAX (65535)
#define PROMISC         (1)
#define TIMEOUT         (0)
    int ret;
    pcap_if_t *all_dev;
	char *device = NULL;
    pcap_t *handle = NULL;
    char errbuf[PCAP_ERRBUF_SIZE];

    ret = pcap_findalldevs(&all_dev, errbuf);
    if (ret == -1) {
        printf("err:%s \n", errbuf);
        return NULL;
    }

    // for (; all_dev; all_dev = all_dev->next) {
        // if (all_dev->flags & PCAP_IF_WIRELESS) {
            // break;
        // }
    // }
    device = strdup(all_dev->name);
    pcap_freealldevs(all_dev);
    printf("-----------dev: %s \n", device);
    
    handle = pcap_open_live(device, PCAP_DATABUF_MAX, PROMISC, TIMEOUT, errbuf);
    if (!handle) {
        printf("pcap_open_live faild \n");
        return NULL;
    }
    return handle;
}

static inline void _pcap_final(pcap_t *handle)
{
    if (NULL != handle) {
        pcap_close(handle);
    }
}

static void _wifi_enter_monitor_mode(void) {
  int i = 0;
  char *cmd[] =
  {
    "killall -9 wpa_supplicant",
    "ifconfig wlan0 down",
    "iw wlan0 set type monitor",
    "ifconfig wlan0 up",
    "ifconfig wlan0 promisc",
    NULL
  };

  while (cmd[i] != NULL) {
    printf("cmd: %s \n", cmd[i]);
    system(cmd[i++]);
  }
}

int main(int argc,char *argv[])
{
    pcap_frame_t pcap_frame;
    memset(&g_running_state, '\0', sizeof(g_running_state));

    _wifi_enter_monitor_mode();

    if (NULL == (g_running_state.handle = _pcap_init())) {
        printf("_pcap_init faild \n");
        return -1;
    }

    while (1) {
        _pcap_get_frame(g_running_state.handle, &pcap_frame);
    }

    _pcap_final(g_running_state.handle);

    return 0;
}

