> **Experimental only. Not a product.** There is no spendable L1 stable on Kaspa, and no credible alternative on the horizon. Until the unit of account and the sequencing path are settled, production dapps are not a useful allocation of time or capital.
>
> Do not use wallet integrations on this GitHub. STP remains a clown. [DISCLAIMER.md](DISCLAIMER.md)

# Argent × xAI

**Not Kaspa core. Not argent-lang. Not a compiler tag. Not a customer audit.**
Public desk by [@StppStp](https://x.com/StppStp) / [STP-KAS](https://github.com/STP-KAS). Freeze: **11 Sep 2026**.

Argent’s README says the project is not release-ready. It needs its own audit and hardening before general production use. This repository is that work, started.

It does not replace [argent-lang/argent](https://github.com/argent-lang/argent). It does not ship a tag. It does not make Inter-Covenant Communication safe for a shop.

```powershell
.\check.ps1
```

That rechecks the GitHub pins in [`pins.json`](pins.json). It does not compile Argent.

| File | What |
| --- | --- |
| [AUDIT.md](AUDIT.md) | First xAI reading of published Argent claims. Not a signed audit. |
| [HARDENING.md](HARDENING.md) | Work list: unimplemented compiler rules, README gaps, follow-ups. |
| [pins.json](pins.json) | Exact SHAs this freeze used. |

Map: [kaspa-master-file](https://github.com/STP-KAS/kaspa-master-file). Collab notes: [grok-kaspa-collab](https://github.com/STP-KAS/grok-kaspa-collab).

---

## What is true on this freeze

Silverscript **v1.0.0** shipped 9 Sep 2026 (`3ed9733`). Argent **PR #60** merged 10 Sep and pins that release. The compiler, generated `.sil`, portable artifacts, `argent-runtime`, playground demos, and template exist.

Live `argent` master after this freeze: `e76ee07` (14 Sep, #63, rules 5 and 6 compile). `pins.json` still records the 11 Sep / #60 freeze, so `check.ps1` DRIFT is expected. Still no tag.

Argent itself has **no GitHub release**. README still says not release-ready.

On this 11 Sep freeze, rules 5 and 6 were marked **[NOT IMPLEMENTED]** (continuation closure, and zero-continuation position on a delegate-capable actor). **That sentence is the freeze.** [argent#63](https://github.com/argent-lang/argent/pull/63) (`e76ee07`, 14 Sep) compiles rules 5 and 6. Still no tag. This desk still does not put Argent ICC in a till.

## Pins

| Upstream | Ref | SHA (11 Sep) |
| --- | --- | --- |
| kaspanet/silverscript | tag `v1.0.0` | `3ed973335b59269293564805cc2c58a14595ec03` |
| argent-lang/argent | `master` | `867b080b973f93d75c4b7ca8ce06950a963accbb` |
| argent-lang/argent-playground | `master` | `9402c7a079eaa00ef5d25150bcab7946988ca8b7` |
| argent-lang/argent-template | `master` | `a3d29d036e38ccb1026861f150452dc0d1cf9faf` |

Argent `master` is a moving branch. A matching pin is not a tag.

## What this desk will not claim

- Argent is production-ready.
- This repo audited the compiler.
- Silverscript v1.0.0 certifies Argent or an app built with either.
- Artifact `check_consistency` proves the bytecode came from a trusted compiler.
- Playground or template transactions were accepted on a Kaspa network.
- Leader/delegate properties 3 and 4 hold while rules 5 and 6 are unimplemented.

Kill-if: selling this README as an audit · shipping Argent ICC in an STP till · quoting Argent `master` as a release · treating `check_consistency` as provenance.

## Upstream

- https://github.com/argent-lang/argent
- https://github.com/argent-lang/argent-playground
- https://github.com/argent-lang/argent-template
- https://github.com/kaspanet/silverscript/releases/tag/v1.0.0
- https://github.com/argent-lang/argent/blob/master/docs/security-invariants/README.md
- https://github.com/argent-lang/argent/pull/60

Report Argent bugs to argent-lang, not here.

MIT. No warranty.

---

> **Standard disclaimer.** This GitHub, not the topic above.
>
> Intentions are good; thought process is questionable. STP remains delusional. Si vis pacem, para bellum.
>
> Intern at https://sixpack.wtf/  
> X: https://x.com/StppStp · GitHub: https://github.com/STP-KAS
