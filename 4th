lock = threading.Lock()
if __name__ == "__main__":

    num = 0

    semaphore = threading.BoundedSemaphore(5)
    lst_record_threads = []
    for index in range(1, 462):
        print(f"正在抓取{index}")
        semaphore.acquire()
        t = threading.Thread(target=run, args=(index, ))
        t.start()
        lst_record_threads.append(t)

    for rt in lst_record_threads:
        rt.join()

    print("数据爬取完毕")
