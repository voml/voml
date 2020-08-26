let path = require("path")

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
                    ['basic/container', '词典与列表'],
                    ['basic/scope', '路由与域'],
                ]
            },
            {
                title: '其他',
                collapsable: false,
                children: [
                    ['advance/', '进阶用法'],
                    ['advance/macros', '宏'],
                    ['advance/other', '非法输入'],
                    ['advance/features', '可能的新特性'],
                    ['advance/history', '更新历史'],
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
                title: 'Tutorials',
                collapsable: false,
                children: [
                    ['basic/', 'Basic Concepts'],
                ]
            },
            {
                title: 'Migrate',
                collapsable: false,
                children: [
                    ['migrate/From JSON', 'From JSON'],
                    ['migrate/From TOML', 'From TOML'],
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
    plugins: [
        [
            'shiki',
            {
                theme: 'monokai',
                langs: [
                    {
                        id: 'arc',
                        scopeName: 'source.arc',
                        path: path.resolve(__dirname, 'public/arc.tmLanguage.json'),
                        aliases: []
                    }
                ]
            }
        ],
    ],
};
