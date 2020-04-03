const locale_cn = {
    selectText: '选择语言',
    label: '简体中文',
    editLinkText: '在 GitHub 上编辑此页',
    serviceWorker: {
        updatePopup: {
            message: "发现新内容可用.",
            buttonText: "刷新"
        }
    },
    sidebar: {
        "/cn/": [
            {
                title: '教程',
                collapsable: false,
                children: [
                    ['basic/', '基本语法'],
                    ['basic/number', '数字详解'],
                    ['basic/string', '字符详解'],
                ]
            },
            {
                title: '其他',
                collapsable: false,
                children: [
                    ['advance/', '进阶用法'],
                    ['advance/macros', '宏'],
                    ['advance/history', '进阶用法'],
                ]
            },
            {
                title: '迁移',
                collapsable: false,
                children: [
                    ['migrate/From JSON', 'JSON 迁移手册'],
                    ['migrate/From YAML', 'YAML 迁移手册'],
                    ['migrate/From TOML', 'TOML 迁移手册'],
                    ['migrate/From HOCON', 'HOCON 迁移手册'],
                ]
            },
        ],
    }
}

const locale_en = {
    selectText: 'Languages',
    label: 'English',
    ariaLabel: 'Languages',
    editLinkText: 'Edit this page on GitHub',
    serviceWorker: {
        updatePopup: {
            message: "New content is available.",
            buttonText: "Refresh"
        }
    },
    sidebar: {
        "/en/": [
            {
                title: 'Appendix',
                collapsable: true,
                children: [
                    ['migrate/From JSON', 'Appendix A'],
                    ['migrate/From YAML', 'Appendix A'],
                ]
            },
        ]
    }
}

module.exports = {
    dest: 'docs/.build',
    locales: {
        '/cn/': {
            lang: 'zh-CN',
            title: 'Arc 配置语言',
            lastUpdated: 'Last Updated',
        },
        '/en/': {
            lang: 'en-US',
            title: 'Arc Language',
            lastUpdated: 'Last Updated',
        }
    },
    head: [
        ['link', { rel: 'shortcut icon', type: "image/x-icon", href: './favicon.png' }]
    ],
    themeConfig: {
        repo: 'nyar-lang/arc-language',
        editLinks: true,
        docsDir: 'docs',
        markdown: {
            lineNumbers: true
        },
        locales: {
            '/cn/': locale_cn,
            '/en/': locale_en,
        },
    },
    serviceWorker: true,
    markdown: {
        config: md => {
        }
    },
    plugins: {

    }
};
