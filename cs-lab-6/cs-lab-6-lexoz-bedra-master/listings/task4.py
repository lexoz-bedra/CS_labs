from time import process_time
from tracemalloc import start, get_traced_memory


def lcs(arr1, arr2):
    n = len(arr1)
    m = len(arr2)
    dp = [[0] * (m + 1) for i in range(n + 1)]
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if arr1[i - 1] == arr2[j - 1]:
                dp[i][j] = dp[i - 1][j - 1] + 1
            else:
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
    return dp[n][m]


if __name__ == '__main__':
    start()
    with open('input.txt', 'r') as f:
        a = int(f.readline())
        seq1 = [int(i) for i in f.readline().split()]
        b = int(f.readline())
        seq2 = [int(i) for i in f.readline().split()]
    with open('output.txt', 'w') as g:
        g.write(str(lcs(seq1, seq2)))

    print('Time:', str(process_time()), 'sec')
    print('Memory usage:', str(get_traced_memory()[1] / 1024), 'KB')
